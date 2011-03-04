#to send /proc/loadavg data over a serial port to arduino loadmeter
#regex is probably ^.{4}

require 'rubygems'  
require 'serialport' 
#params for serial port  
#most of this ganked from http://stackoverflow.com/questions/4113992/write-byte-to-arduino-from-ruby-over-serial
port_str = "/dev/ttyACM0"
baud_rate = 9600  
data_bits = 8  
stop_bits = 1  
parity = SerialPort::NONE
sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)

i = 15
loop do
  sp.putc(i)
  puts 'Wrote: %d = %bb' % [ i, i ]
  i = (i == 15) ? 0 : (i + 1)
  sleep(10)
end  
