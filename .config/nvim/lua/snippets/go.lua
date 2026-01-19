local ls = require("luasnip")
local s = ls.s
local fmt = require("luasnip.extras.fmt").fmt
local i = ls.insert_node
local rep = require("luasnip.extras").rep

return {
	s("func", fmt("func {}({}) {} {{\n\t{}\n}}", { i(1), i(2), i(3), i(0) })),
	s("efi", fmt("{}, {} := {}({})\nif {} != nil {{\n\t{}\n}}", { i(1), i(2, "err"), i(3), i(4), rep(2), i(0) })),
}
