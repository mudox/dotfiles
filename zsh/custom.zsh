# vim: filetype=zsh foldmethod=marker

local init_dir="${MDX_DOT_DIR}/zsh/zshrc"

for f in "${init_dir}"/*.zsh; do
	source $f
done
