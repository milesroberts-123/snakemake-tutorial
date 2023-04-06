rule step_two:
	input: "step_one_output.txt"
	output: "step_two_output.txt"
	shell: "cp {input} {output}"
