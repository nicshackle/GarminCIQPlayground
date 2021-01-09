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
       setLayout(Rez.Layouts.WatchFace(dc));
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
	    loc = info.position.toGeoString(Position.GEO_DMS);
	    var view = View.findDrawableById("TimeLabel");
        view.setText(loc);
        WatchUi.requestUpdate();
	}

    // Update the view
    function onUpdate(dc) {
        // Get and show the current time
        var clockTime = System.getClockTime();
        var timeString = Lang.format("$1$:$2$", [clockTime.hour, clockTime.min.format("%02d")]);
        var view = View.findDrawableById("TimeLabel");
        view.setText(timeString+loc);
       //dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_RED);
       // dc.drawText(50, 50, Graphics.FONT_LARGE, lat, Graphics.TEXT_JUSTIFY_LEFT);

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
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
