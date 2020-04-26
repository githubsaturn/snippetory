
Sources: 

[this](https://help.ubuntu.com/community/WakeOnLan) and [this](http://ubuntuguide.net/remotely-turn-on-ubuntu-from-lan) and [this](https://askubuntu.com/questions/1053302/wake-on-lan-not-working-if-i-turn-of-with-ubuntu).



## Target machine:

1) Enable on BIOS

2) Enable on OS:
```
sudo ethtool -s eth0 wol g
```

`eth0` could be any network interface in `ifconfig`

3) Make sure step 2 is done after each reboot.

a) Old ubuntu versions used to have `ifupdown`, in that case do this:

```
shahar@shahar-backup:~$ cat /etc/network/interfaces

# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).
# The loopback network interface

auto lo
iface lo inet loopback
# The primary network interface

auto eth0
iface eth0 inet static
        address 10.0.0.1
        netmask 255.255.255.0
        gateway 10.0.0.138
        up ethtool -s eth0 wol g
```

b) on newer Ubuntu versions (18 and onwards), they use `netplan`, in this case do this:

```
kasra@laptop ➜  ~ cat /etc/netplan/50-cloud-init.yaml 

# This file is generated from information provided by the datasource.  Changes
# to it will not persist across an instance reboot.  To disable cloud-init's
# network configuration capabilities, write a file
# /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg with the following:
# network: {config: disabled}
network:
    ethernets:
        enp1s0:
            match:
                macaddress: 00:16:1c:cf:fa:bb
            dhcp4: true
            wakeonlan: true
    version: 2

```


## On source machine


If you're on ubuntu, use:
```
sudo apt-get install wakeonlan
wakeonlan 00:18:f3:c2:b1:07
```



## Technical details

All you need to do to wake up a machine is to broadcast magic packet to the network. The 'magic packet' consists of 6 times 0xFF followed by 16 times the hardware address of the NIC.

Java implementation from http://www.jibble.org/wake-on-lan/

```
import java.io.*;
import java.net.*;

public class WakeOnLan {
    
    public static final int PORT = 9;    
    
    public static void main(String[] args) {
        
        if (args.length != 2) {
            System.out.println("Usage: java WakeOnLan <broadcast-ip> <mac-address>");
            System.out.println("Example: java WakeOnLan 192.168.0.255 00:0D:61:08:22:4A");
            System.out.println("Example: java WakeOnLan 192.168.0.255 00-0D-61-08-22-4A");
            System.exit(1);
        }
        
        String ipStr = args[0];
        String macStr = args[1];
        
        try {
            byte[] macBytes = getMacBytes(macStr);
            byte[] bytes = new byte[6 + 16 * macBytes.length];
            for (int i = 0; i < 6; i++) {
                bytes[i] = (byte) 0xff;
            }
            for (int i = 6; i < bytes.length; i += macBytes.length) {
                System.arraycopy(macBytes, 0, bytes, i, macBytes.length);
            }
            
            InetAddress address = InetAddress.getByName(ipStr);
            DatagramPacket packet = new DatagramPacket(bytes, bytes.length, address, PORT);
            DatagramSocket socket = new DatagramSocket();
            socket.send(packet);
            socket.close();
            
            System.out.println("Wake-on-LAN packet sent.");
        }
        catch (Exception e) {
            System.out.println("Failed to send Wake-on-LAN packet: + e");
            System.exit(1);
        }
        
    }
    
    private static byte[] getMacBytes(String macStr) throws IllegalArgumentException {
        byte[] bytes = new byte[6];
        String[] hex = macStr.split("(\\:|\\-)");
        if (hex.length != 6) {
            throw new IllegalArgumentException("Invalid MAC address.");
        }
        try {
            for (int i = 0; i < 6; i++) {
                bytes[i] = (byte) Integer.parseInt(hex[i], 16);
            }
        }
        catch (NumberFormatException e) {
            throw new IllegalArgumentException("Invalid hex digit in MAC address.");
        }
        return bytes;
    }
    
   
}
```
