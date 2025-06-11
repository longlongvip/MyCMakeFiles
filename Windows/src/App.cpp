#include <Windows.h>

int WinMain(_In_ HINSTANCE hInstance, _In_opt_ HINSTANCE hPrevInstance, _In_ LPSTR lpCmdLine, _In_ int nShowCmd)
{
    MessageBoxW(NULL, L"Hello MessageBox", L"Msg", MB_OKCANCEL);

    return 0;
}
