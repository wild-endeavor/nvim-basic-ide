
local status_ok, dap_go = pcall(require, "dap-go")
if not status_ok then
  return
end

dap_go.setup()

local status_ok, dap_python = pcall(require, "dap-python")
if not status_ok then
  return
end

dap_python.setup("~/envs/debugpy10/bin/python")
dap_python.test_runner = 'pytest'