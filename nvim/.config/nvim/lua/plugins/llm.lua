return {
  {
    "huggingface/llm.nvim",
    opts = {
      backend = "openai",
      model = "qwen/qwen3-coder-30b",
      url = "http://localhost:1234/v1",
      accept_keymap = "<c-j>",
    },
  },
}
