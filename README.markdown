Enhanced Growl
==============

What is this?
-------------

A TTYtter extension for Enhanced Growl Notifies.

It adds a new Application to the Growl "Applications" tab named "TTYtter enhanced Growl".
You can configure and customize each of the different notification types that TTYtter provides. 
These are: default, dm, me, reply, search.

Enhanced Growl activates by default "dm" and "reply".

How to run?
-----------

To run it you need to:

1. Load the extension:
	Simply load it adding *-exts="/path/to/enhanced_growl.pl"* to your ttytter invocation.

2. Specify the notifications driver:
	Add **after loading the extension!!** Add *-notifytype=enhanced_growl* to your ttytter invocation

Putting it all together:
*-exts="/path/to/enhanced_growl.pl" -notifytype=enhanced_growl*

NOTE
----

I have not tested this code with anything but my own setup.  If you *do* run it and encounter problems, I'd love to hear about it.