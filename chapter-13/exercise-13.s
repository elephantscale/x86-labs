	.intel_syntax	noprefix
	.text
	.global scrabble_score
	.type scrabble_score, @function
	
scrabble_score:
	/* TODO: Complete this */
	ret

letter_scores:	# table of scores indexed by letter adjusted to 0..25
	.byte	1	# A
	.byte	3	# B
	.byte	3	# C
	.byte	2	# D
	.byte	1	# E
	.byte	4	# F
	.byte	2	# G
	.byte	4	# H
	.byte	1	# I
	.byte	8	# J
	.byte	5	# K
	.byte	1	# L
	.byte	3	# M
	.byte	1	# N
	.byte	1	# O
	.byte	3	# P
	.byte	10	# Q
	.byte	1	# R
	.byte	1	# S
	.byte	1	# T
	.byte	1	# U
	.byte	4	# V
	.byte	4	# W
	.byte	8	# X
	.byte	4	# Y
	.byte	10	# Z

	.global phone_keypad_button
	.type phone_keypad_button, @function
	
phone_keypad_button:
	/* TODO: Complete this */
	ret

keymap:	# table of key value idexed by letter adjusted to 0..25
	.byte	2	# A
	.byte	2	# B
	.byte	2	# C
	.byte	3	# D
	.byte	3	# E
	.byte	3	# F
	.byte	4	# G
	.byte	4	# H
	.byte	4	# I
	.byte	5	# J
	.byte	5	# K
	.byte	5	# L
	.byte	6	# M
	.byte	6	# N
	.byte	6	# O
	.byte	7	# P
	.byte	7	# Q
	.byte	7	# R
	.byte	7	# S
	.byte	8	# T
	.byte	8	# U
	.byte	8	# V
	.byte	9	# W
	.byte	9	# X
	.byte	9	# Y
	.byte	9	# Z
