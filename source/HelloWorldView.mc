using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.System;
using Toybox.Lang;
using Toybox.Position;

class HelloWorldView extends WatchUi.View {

	var loc = "hello";

    function initialize() {
        View.initialize();
        Position.enableLocationEvents(Position.LOCATION_CONTINUOUS, method(:onPosition));
        
    }

    // Load your resources here
    function onLayout(dc) {
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }
    
    
	function onPosition(info) {
	    var myLocation = info.position.toDegrees();
	    System.println("Latitude: " + myLocation[0]); // e.g. 38.856147
	    System.println("Longitude: " + myLocation[1]); // e.g -94.800953
	    loc = info.position.toGeoString(Position.GEO_DEG);
        WatchUi.requestUpdate();
	}

    // Update the view
    function onUpdate(dc) {
    // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
        
        dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_PINK);
        
        dc.fillCircle(dc.getWidth() / 2,dc.getHeight() / 2, 100);
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_RED);
        dc.drawText(
		        dc.getWidth() / 2,                      // gets the width of the device and divides by 2
		        dc.getHeight() / 2,                     // gets the height of the device and divides by 2
		        Graphics.FONT_XTINY,                    // sets the font size
		        loc,                          // the String to display
		        Graphics.TEXT_JUSTIFY_CENTER            // sets the justification for the text
                );

        System.print(".");
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
    }

}
