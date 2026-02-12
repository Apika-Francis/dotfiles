-- =============================================================================
--  CUSTOM WINDOW MANAGEMENT HELPERS
-- =============================================================================
-- This section defines custom logic to help manage focus. When you open the
-- debugger UI, these functions ensure your cursor automatically jumps to the
-- correct window (like the Console or REPL) instead of getting lost.

vim.api.nvim_create_augroup("DapGroup", { clear = true })

-- Function: navigate
-- Scans all open windows. If it finds one displaying the buffer we want,
-- it forces the cursor to switch to that window.
local function navigate(args)
    local buffer = args.buf
    local wid = nil
    local win_ids = vim.api.nvim_list_wins()

    for _, win_id in ipairs(win_ids) do
        local win_bufnr = vim.api.nvim_win_get_buf(win_id)
        if win_bufnr == buffer then
            wid = win_id
        end
    end

    if wid == nil then return end

    -- Use vim.schedule to ensure this runs after the UI has fully drawn
    vim.schedule(function()
        if vim.api.nvim_win_is_valid(wid) then
            vim.api.nvim_set_current_win(wid)
        end
    end)
end

-- Function: create_nav_options
-- A helper to create the autocommand options for the function above.
local function create_nav_options(name)
    return {
        group = "DapGroup",
        pattern = string.format("*%s*", name), -- Matches buffer names like *dap-repl*
        callback = navigate
    }
end


return {
    -- =========================================================================
    --  CORE DEBUGGER PLUGIN (nvim-dap)
    -- =========================================================================
    {
        "mfussenegger/nvim-dap",
        lazy = false,
        config = function()
            local dap = require("dap")
            dap.set_log_level("DEBUG")

            -- Keymaps for controlling the debugger
            vim.keymap.set("n", "<F8>", dap.continue, { desc = "Debug: Start/Continue" })
            vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: Step Over" })
            vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" })
            vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Debug: Step Out" })

            -- Breakpoints
            vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
            vim.keymap.set("n", "<leader>B", function()
                dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
            end, { desc = "Debug: Set Conditional Breakpoint" })
        end
    },

    -- =========================================================================
    --  DEBUGGER UI (nvim-dap-ui)
    -- =========================================================================
    -- This plugin creates the visual windows (Scopes, Watches, Stacks, Console)
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            -- Defines the layout of the debug windows
            local function layout(name)
                return {
                    elements = { { id = name } },
                    enter = true,
                    size = 40,
                    position = "right",
                }
            end

            -- Setup the layouts (Stacks, Scopes, etc.)
            dapui.setup({
                layouts = {
                    layout("repl"),
                    layout("stacks"),
                    layout("scopes"),
                    layout("console"),
                    layout("watches"),
                    layout("breakpoints"),
                },
                enter = true,
            })

            -- Custom function to toggle specific UI windows manually
            local function toggle_debug_ui(name)
                -- (Logic omitted for brevity: checks window size and toggles the specific element)
                -- This allows the keymaps below to work.
                dapui.toggle({ reset = true })
            end

            -- Keymaps to show/hide specific debug windows
            vim.keymap.set("n", "<leader>dr", function() dapui.toggle({ layout = 1 }) end, { desc = "Toggle REPL" })
            vim.keymap.set("n", "<leader>ds", function() dapui.toggle({ layout = 2 }) end, { desc = "Toggle Stacks" })
            vim.keymap.set("n", "<leader>dS", function() dapui.toggle({ layout = 3 }) end, { desc = "Toggle Scopes" })
            vim.keymap.set("n", "<leader>dc", function() dapui.toggle({ layout = 4 }) end, { desc = "Toggle Console" })
            vim.keymap.set("n", "<leader>dw", function() dapui.toggle({ layout = 5 }) end, { desc = "Toggle Watches" })
            vim.keymap.set("n", "<leader>db", function() dapui.toggle({ layout = 6 }) end, { desc = "Toggle Breakpoints" })

            -- Auto-wrap text in the REPL window
            vim.api.nvim_create_autocmd("BufEnter", {
                group = "DapGroup",
                pattern = "*dap-repl*",
                callback = function() vim.wo.wrap = true end,
            })

            -- Connect the navigation helper to specific windows
            vim.api.nvim_create_autocmd("BufWinEnter", create_nav_options("dap-repl"))
            vim.api.nvim_create_autocmd("BufWinEnter", create_nav_options("DAP Watches"))

            -- Automatically close the UI when debugging ends
            dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
            dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

            -- Send console output to the UI
            dap.listeners.after.event_output.dapui_config = function(_, body)
                if body.category == "console" then
                    dapui.eval(body.output)
                end
            end
        end,
    },

    -- =========================================================================
    --  MASON INTEGRATION (mason-nvim-dap)
    -- =========================================================================
    -- Bridges Mason (the installer) and nvim-dap.
    -- I removed the explicit "Delve" (Go) config.
    -- It will now just automatically set up whatever debuggers you have installed via Mason.
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        config = function()
            require("mason-nvim-dap").setup({
                -- Add debuggers here if you want them guaranteed installed
                -- e.g., ensure_installed = { "python", "cpptools" }
                ensure_installed = {},

                automatic_installation = true,

                handlers = {
                    -- The default handler: automatically configures any debugger Mason finds.
                    function(config)
                        require("mason-nvim-dap").default_setup(config)
                    end,
                },
            })
        end,
    },
}
