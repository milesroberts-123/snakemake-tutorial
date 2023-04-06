rule step_three:
	input: "step_two_output.txt"
	output: "final_output.txt"
	shell: "cp {input} {output}"
