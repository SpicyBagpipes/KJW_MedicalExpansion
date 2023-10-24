@echo off
hemtt.exe script bump_minor.rhai
hemtt.exe release --no-archive
hemtt.exe script clear_patch.rhai
start "" ".hemttout\release"