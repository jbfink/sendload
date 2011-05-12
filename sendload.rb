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

#i = 15
loop do
  f = File.open("/proc/loadavg", "r")
  raw = f.gets
  loadavg = ((raw.scan(/^.{4}/)[0].to_f) * 100).to_i
#  puts f
  puts loadavg
  sp.putc(loadavg)
  puts 'Wrote: ' + loadavg.to_s
#  i = (i == 15) ? 0 : (i + 1)
  f.close
  sleep(1)
end  
