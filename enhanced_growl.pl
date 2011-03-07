#!/usr/bin/perl

sub notifier_enhanced_growl {
	my $class = shift;
	my $text = shift;
	my $ref = shift; # not used in this version

	if (!defined($class) || !defined($growl_path)) {
		# we are being asked to initialize
		$growl_path = &growlcheck("trying to find Growl",
			"Growl.prefPane", "com.Growl.GrowlHelperApp",
"Growl must be installed to use Growl notifications.");

		if (!defined($class)) {
			#return 1 if ($script || $notifyquiet);
			return 1 if ($script);
			$class = 'default';
			$text = 
'Growl support activated\n
You can configure notifications for TTYtter Growl enhanced in the Growl preference pane.';
		}
	}
	
$text =~ s/"/\\"/g;

$applescript = <<HEREDOC
tell application "GrowlHelperApp"
set the allNotificationsList to {"default", "dm", "reply", "search", "me"}
set the enabledNotificationsList to {"dm", "reply"}
register as application "TTYtter enhanced Growl" all notifications allNotificationsList default notifications enabledNotificationsList icon of application "Terminal"
notify with name "$class" title "$class" description "$text" application name "TTYtter enhanced Growl"
end tell
HEREDOC
;

	system("osascript <<EOS\n" . $applescript . "EOS\n");
	return 1;
}
1;

sub growlcheck {
	my ($prompt, $filename, $process, $fatal) = (@_);
	
	print $stdout "$prompt ...\n" unless ($silent);
	
	if (-e "/Library/PreferencePanes/$filename" || 
		-e "~/Library/PreferencePanes/$filename") {
		system("open -b $process");
		return 1;
	} else {
		print $stdout "$filename not found.\n";
		if ($fatal) {
			print $stdout $fatal;
			exit(1);
		}
	}
};