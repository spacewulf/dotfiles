return {
	{
		"stevearc/vim-arduino",
		config = function()
			require("config.arduino")
		end,
		cmd = {
			"ArduinoAttach",
			"ArduinoVerify",
			"ArduinoVerify",
			"ArduinoUploadAndSerial",
			"ArduinoSerial",
			"ArduinoChooseBoard",
			"ArduinoChooseProgrammer",
		},
		keys = {
			{ "<leader>aa", "<cmd>ArduinoAttach<cr>" },
			{ "<leader>av", "<cmd>ArduinoVerify<cr>" },
			{ "<leader>au", "<cmd>ArduinoUpload<cr>" },
			{ "<leader>aus", "<cmd>ArduinoUploadAndSerial<cr>" },
			{ "<leader>as", "<cmd>ArduinoSerial<cr>" },
			{ "<leader>ab", "<cmd>ArduinoChooseBoard<cr>" },
			{ "<leader>ap", "<cmd>ArduinoChooseProgrammer<cr>" },
		},
	},
}
