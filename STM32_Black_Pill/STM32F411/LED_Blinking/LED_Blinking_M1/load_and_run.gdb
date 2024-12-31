# Connect to OpenOCD
target remote localhost:3333

# Reset the target and halt it
monitor reset halt

break main
# Load the ELF file into the target memory
load

# Set the program counter (optional)
monitor reset init

# Start the program execution
continue
