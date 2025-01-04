import serial
import matplotlib.pyplot as plt
import matplotlib.animation as animation
from collections import deque

# COM port configuration
COM_PORT = 'COM15'   # Replace with your COM port (e.g., COM3, /dev/ttyUSB0, etc.)
BAUD_RATE = 115200    # Set the baud rate (must match the device's baud rate)
DATA_POINTS = 500   # Number of data points to display in the plot

# Initialize serial communication
try:
    ser = serial.Serial(COM_PORT, BAUD_RATE, timeout=1)
    print(f"Connected to {COM_PORT} at {BAUD_RATE} baud.")
except serial.SerialException as e:
    print(f"Error opening serial port: {e}")
    exit()

# Initialize data deque
data = deque([0] * DATA_POINTS, maxlen=DATA_POINTS)

# Initialize plot
fig, ax = plt.subplots()
line, = ax.plot(range(DATA_POINTS), data)
ax.set_ylim(0, 512)  # Adjust Y-axis limits based on expected data (e.g., 0-1023 for 10-bit ADC)
ax.set_xlim(0, DATA_POINTS)
ax.set_title("Real-Time Waveform from COM Port")
ax.set_xlabel("Data Points")
ax.set_ylabel("Value")

def update(frame):
    """Update the plot with new data from the COM port."""
    try:
        if ser.in_waiting > 0:  # Check if data is available in the serial buffer
            raw_value = ser.readline().decode('utf-8').strip()  # Read and decode data
            if raw_value.isdigit():  # Ensure the data is numeric
                data.append(int(raw_value))  # Add the new data point to the deque
                line.set_ydata(data)  # Update the Y data of the plot
    except Exception as e:
        print(f"Error reading data: {e}")
    return line,

# Animate the plot
ani = animation.FuncAnimation(fig, update, interval=10, blit=True)

# Display the plot
plt.show()

# Close serial connection on program exit
ser.close()
