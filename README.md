# sendStatustoSlack.sh

(stdin) | ./sendStatustoSlack.sh

```
$ df -h | grep -E "root|mnt" | awk '{print $(NF-1)"\t"$2"\t"$3"\t"$NF"\t\t"$1}' |  ./sendStatustoSlack.sh
<<<20190817-145115>>>
91%    15G    13G    /        /dev/root
80%    15G    12G    /mnt/tpd2        /dev/sdb1
92%    29G    27G    /mnt/tpd1        /dev/sda1
63%    875G    549G    /mnt/xm        //192.168.11.3/xmedia
63%    875G    549G    /mnt/centradio        //192.168.11.3/radio
63%    875G    549G    /mnt/denpa954        //192.168.11.3/ydl/denpa954
63%    875G    549G    /mnt/syncDrive        //192.168.11.3/syncDrive/radioGdrive
30%    5.4T    1.6T    /mnt/nas        //192.168.11.18/nas/
```
