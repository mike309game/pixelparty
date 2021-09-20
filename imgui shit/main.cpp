#include <Windows.h>
#include <commctrl.h>
#pragma comment(lib, "comctl32.lib")

#include "imgui.h"
#include "imgui_impl_dx11.h"
#include "imgui_impl_win32.h"

#define fn_export extern "C" __declspec(dllexport)

extern IMGUI_IMPL_API LRESULT ImGui_ImplWin32_WndProcHandler(HWND hWnd, UINT msg, WPARAM wParam, LPARAM lParam);

LRESULT CALLBACK ImGuiGMSSubclassProc(HWND hWnd, UINT uMsg, WPARAM wParam,
	LPARAM lParam, UINT_PTR uIdSubclass, DWORD_PTR dwRefData) {

	if (ImGui_ImplWin32_WndProcHandler(hWnd, uMsg, wParam, lParam)) {
		return true;
	}

	return DefSubclassProc(hWnd, uMsg, wParam, lParam);
}

static char** room_name_list;
static size_t room_count;

fn_export double imgui_step(double keycheck) {
	ImGui_ImplDX11_NewFrame();
	ImGui_ImplWin32_NewFrame();
    ImGui::NewFrame();
	static int current_selected = 0;
	if(keycheck) {
		ImGui::OpenPopup("Stuffs");
	}

	if(ImGui::BeginPopupModal("Stuffs",nullptr, ImGuiWindowFlags_AlwaysAutoResize | ImGuiWindowFlags_NoMove | ImGuiWindowFlags_NoSavedSettings)) {
		ImGui::ListBox("##roomlistbox", &current_selected, room_name_list,(int)room_count);
		ImGui::SameLine();
		if(ImGui::Button("Go to..")) {
			/*double* selected_buffer_double = reinterpret_cast<double*>(thebuffer);
			thebuffer[0] = static_cast<double>(current_selected);
			ImGui::CloseCurrentPopup();
			modal_open = false;
			return 1.0;*/
			ImGui::CloseCurrentPopup();
			ImGui::EndPopup();
			return current_selected | (1 << 31);
		}
		if(ImGui::Button("oops fuck nevermind")) {
			ImGui::CloseCurrentPopup();
			ImGui::EndPopup();
			return 0.0;
		}
		ImGui::Text("Room count: %d, Current: %d", room_count, current_selected);
		ImGui::EndPopup();
	}
	ImGui::EndFrame();
	return 0.0;
}

fn_export double imgui_render() {
	ImGui::Render();
	ImGui_ImplDX11_RenderDrawData(ImGui::GetDrawData());
	ImGuiIO& io = ImGui::GetIO();
	/*if (io.ConfigFlags & ImGuiConfigFlags_ViewportsEnable) {
		ImGui::UpdatePlatformWindows();
		ImGui::RenderPlatformWindowsDefault();
	}*/
	return 0.0;
}

fn_export double imgui_setup_buffers(char* room_names_buffer, double room_count) {
	::room_count = room_count;
	room_name_list = new char*[room_count];
	char* ptrcurrent = room_names_buffer;
	for (size_t room_current = 0; room_current < room_count; room_current++)
	{
		room_name_list[room_current] = ptrcurrent;
		ptrcurrent += strlen(ptrcurrent)+1;
	}
	return 0.0;
}

fn_export double imgui_setup(char* hwnd, char* device, char* device_context) {

	// setup context
	IMGUI_CHECKVERSION();
	ImGui::CreateContext();
	
	// Enable keyboard navigation, docking, and viewports
	ImGuiIO& io = ImGui::GetIO(); (void)io;
	//io.ConfigFlags |= ImGuiConfigFlags_NavEnableKeyboard; //you can still control the game when the windows are brought up
	//io.ConfigFlags |= ImGuiConfigFlags_DockingEnable; //you can pass
	//io.ConfigFlags |= ImGuiConfigFlags_ViewportsEnable; //this fucks up drawing and really is not needed at all

	// setup style
	ImGui::StyleColorsClassic(); // :)

	// setup platform/renderer bindings
	ImGui_ImplWin32_Init((void*)hwnd);
	ImGui_ImplDX11_Init((ID3D11Device*)device, (ID3D11DeviceContext*)device_context);

	// Subclass GM window to update keyboard/mouse/etc events
	SetWindowSubclass((HWND)hwnd, ImGuiGMSSubclassProc, 1, 1);

	return 0.0;
}

fn_export double imgui_cleanup(char* hwnd) {

	RemoveWindowSubclass((HWND)hwnd, ImGuiGMSSubclassProc, 1);

	ImGui_ImplDX11_Shutdown();
	ImGui_ImplWin32_Shutdown();
	ImGui::DestroyContext();

	return 0.0;
}

BOOL WINAPI DllMain(
	HINSTANCE hinstDLL,
	DWORD fdwReason,
	LPVOID lpReserved)
{
	switch (fdwReason)
	{
	case DLL_PROCESS_ATTACH:
		break;

	case DLL_THREAD_ATTACH:
		break;

	case DLL_THREAD_DETACH:
		break;

	case DLL_PROCESS_DETACH:
		break;
	}
	return TRUE;
}