[net]
download_bw=0
upload_bw=0
firewall_policy=0
mtu=0

[rtp]
audio_rtp_port=7078
video_rtp_port=9078
audio_jitt_comp=60
video_jitt_comp=60
nortp_timeout=30

[sound]
remote_ring=/usr/share/sounds/linphone/ringback.wav
playback_dev_id=ALSA: default device
ringer_dev_id=ALSA: default device
capture_dev_id=ALSA: default device

[video]
enabled=0
size=cif
display=0
capture=0
show_local=0
self_view=0

[audio_codec_0]
mime=speex
rate=32000
enabled=1

[audio_codec_1]
mime=speex
rate=16000
enabled=1

[audio_codec_2]
mime=speex
rate=8000
enabled=1

[audio_codec_3]
mime=GSM
rate=22050
enabled=1

[audio_codec_4]
mime=GSM
rate=11025
enabled=1

[audio_codec_5]
mime=GSM
rate=8000
enabled=1

[audio_codec_6]
mime=PCMU
rate=8000
enabled=1

[audio_codec_7]
mime=PCMA
rate=8000
enabled=1

[sip]
sip_port=5060
sip_tcp_port=0
guess_hostname=1
inc_timeout=15
use_info=1
use_rfc2833=0
use_ipv6=0
register_only_when_network_is_up=1
default_proxy=0
contact=sip:vmiklos@suse.cz

[GtkUi]
advanced_ui=1
uri0="conference" <sip:3999@voip.suse.de>
uri1="echo test" <sip:39600@voip.suse.de>

[friend_0]
url="echo test" <sip:39600@voip.suse.de>
pol=accept
subscribe=1

[friend_1]
url="conference" <sip:3999@voip.suse.de>
pol=accept
subscribe=1

[auth_info_0]
username=vmiklos
userid=vmiklos
passwd=VOIPSUSEDEPASSWORD
realm="voip.suse.de"

[proxy_0]
reg_proxy=sip:voip.suse.de
reg_identity=sip:vmiklos@voip.suse.de
reg_expires=3600
reg_sendregister=1
publish=0
dial_escape_plus=0

