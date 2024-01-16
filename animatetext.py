for t in range(1000):
	console_frame("\n".join(["*" * (30 + int(30 * math.sin(.1 * x + .1 * t))) for x in range(30)])) # time-varying sine wave
	time.sleep(.04)
