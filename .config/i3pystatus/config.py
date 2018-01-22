from i3pystatus import Status

status = Status()

# Displays clock like this:
# Tue 30 Jul 11:59
status.register(
    "clock",
    format="%a %-d %b %Y %H:%M",)

status.register("cpu_usage_graph")

status.register(
    "cpu_usage_bar",
    format="{usage_bar_cpu0}{usage_bar_cpu1}{usage_bar_cpu2}{usage_bar_cpu3}",
    bar_type="vertical")

# Shows your CPU temperature, if you have a Intel CPU
status.register(
    "temp",
    format="{temp:.0f}°C",)

status.register("mem_bar")

# The battery monitor has many formatting options, see README for details

# This would look like this, when discharging (or charging)
# ↓14.22W 56.15% [77.81%] 2h:41m
# And like this if full:
# =14.22W 100.0% [91.21%]
#
# This would also display a desktop notification (via D-Bus) if the percentage
# goes below 5 percent while discharging. The block will also color RED.
# If you don't have a desktop notification demon yet, take a look at dunst:
#   http://www.knopwob.org/dunst/
status.register(
    'battery',
    format='Battery [{status} ]{percentage_design:.0f}% {remaining}',
    alert=True,
    alert_percentage=15,
    alert_format_body="Battery has only {percentage:.0f}% ({remaining}) "
                      "remaining!",
    status={
        'DPL': 'depleted',
        'CHR': 'charging',
        'DIS': 'discharging',
        'FULL': '',
    }
)

# Shows the address and up/down state of eth0. If it is up the address is shown
# in green (the default value of color_up) and the CIDR-address is shown
# (i.e. 10.10.10.42/24).
# If it's down just the interface name (eth0) will be displayed in red
# (defaults of format_down and color_down)
#
# Note: the network module requires PyPI package netifaces
status.register(
    "network",
    interface="enp3s0",
    format_up="{bytes_sent:3.0f}🢁 {bytes_recv:4.0f}🢃 {network_graph_recv}",
    format_down="")

# Note: requires both netifaces and basiciw (for essid and quality)
status.register(
    "network",
    interface="wlp2s0",
    format_up="{essid} ({quality}%): {bytes_sent:3.0f}🢁 {bytes_recv:4.0f}🢃 "
              "{network_graph_recv}",
    format_down="wifi: down"),

# Shows disk usage of / and /home
status.register(
    "disk",
    path="/home",
    format="/home: {avail:.1f}G",)
status.register(
    "disk",
    path="/",
    format="/: {avail:.1f}G",)

# Shows pulseaudio default sink volume
#
# Note: requires libpulseaudio from PyPI
status.register(
    "pulseaudio",
    color_unmuted="#2080FF",
    multi_colors="True")

status.run()
