# timeSync
PowerShell Program used to synchronize Windows system clock to WWV time signal.

This tool is designed to help you set your system clock to an accuracy of within 10 milliseconds.  When running, tihs window produces a ticking sound in sync with the system clock.  Listen for the difference between the tick played by this window and the tick from your external source.

Use the J and G keys to advance or slow the system clock by 10 milliseconds, respectively. (These keybindings can be edited on lines 13 and 17)
If the system clock is off by a larger margin, use the K and F keys to advance or slow the system clock by 100 milliseconds, respectively. (These keybindings can be edited on lines 21 and 25)

In order to help you identify if your system clock is off by a margin of one whole second or more, no tick is played on seconds 29 or 59.  The WWV broadcasts also do not tick on these seconds.  This behavior can be removed by omitting ` -and !(((Get-date).second -eq 29) -or ((Get-date).second -eq 59))` from line 7.

The WWV broadcasts are sent from the National Institute of Standards and Technology and are available to the public using Amplitude Modulation on radio frequencies of 2.5, 5, 10, 15 and 20 MHz.
