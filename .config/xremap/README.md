A simple script using the xremap project

https://github.com/k0kubun/xremap

Download the hypr.zip from releases

Copy the xremap.service into the /etc/systemd/system/xremap.service

'''
sudo systemctl daemon-reload
sudo systemctl enable xremap.service
sudo systemctl restart xremap.service
'''
