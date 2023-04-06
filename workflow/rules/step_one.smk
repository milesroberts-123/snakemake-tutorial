rule step_one:
	input: "../config/input.txt"
	output: "step_one_output.txt"
	shell: "cp {input} {ouput}"
