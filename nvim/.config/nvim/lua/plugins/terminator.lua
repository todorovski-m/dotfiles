local function init_terminator()
    vim.g["terminator_runfile_map"] = {
        --python = "python -u",
        matlab = "octave",
        --fortran = "cd $dir && gfortran -fimplicit-none $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
        fortran = "cd $dir && make $fileNameWithoutExt && $dir$fileNameWithoutExt",
        gnuplot = "gnuplot --persist"
    }
    vim.g["terminator_split_location"] = "vertical botright"
    --vim.g["terminator_auto_shrink_output"] = 1
end

return {
    -- Run code
    "erietz/vim-terminator",
    init = init_terminator(),
    ft = {"fortran", "python", "matlab"},
}
