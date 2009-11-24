function padInt(num, numZeros) {
        var n = Math.abs(num);
        var zeros = Math.max(0, numZeros - Math.floor(n).toString().length );
        var zeroString = Math.pow(10,zeros).toString().substr(1);
        if( num < 0 ) {
                zeroString = '-' + zeroString;
        }
        return zeroString+n;
}

Timer = function() {
}

Timer.prototype.startTimer = function(intervalCode, startTime) {
	if (startTime) {
		this.startTime = startTime;
	} else {
		this.startTime = Math.round(new Date().getTime()/1000.0);
	}
	this.intervalId = setInterval(""+intervalCode+"", 1000)
	return this
}

Timer.prototype.currentPrettyString = function() {
	elapsedTime = Math.round(new Date().getTime()/1000.0) - this.startTime;
	control = elapsedTime;
	if (control >= 3600) {
		hours = Math.floor(control/3600.0);
		control = control-(3600*hours);
	} else {
		hours = 0
	}
	if (control >= 60) {
		minutes = Math.floor(control/60.0);
		control = control-(60*minutes);
	} else {
		minutes = 0
	}
	seconds = control;
	return ""+padInt(hours, 2)+":"+padInt(minutes, 2)+":"+padInt(seconds, 2)+""
}

Timer.prototype.currentElapsed = function() {
	return (Math.round(new Date().getTime()/1000.0) - this.startTime)
}

Timer.prototype.stopTimer = function() {
	clearInterval(this.intervalId)
	this.stopTime = Math.round(new Date().getTime()/1000.0);
	this.elapsedTime = this.stopTime - this.startTime;
	control = this.elapsedTime;
	if (control >= 3600) {
		this.hours = Math.floor(control/3600.0);
		control = control-(3600*this.hours);
	} else {
		this.hours = 0
	}
	if (control >= 60) {
		this.minutes = Math.floor(control/60.0);
		control = control-(60*this.minutes);
	} else {
		this.minutes = 0
	}
	this.seconds = control;
	this.prettyString = ""+padInt(this.hours, 2)+":"+padInt(this.minutes, 2)+":"+padInt(this.seconds, 2)+""
	return this
}

Timer.prototype.reset = function() {
	this.startTime = 0
	this.stopTime = 0
	this.elapsedTime = 0
	this.hours = 0
	this.minutes = 0
	this.seconds = 0
	this.prettyString = 0
	this.intervalId = 0
}

Time = function() {
	
}

Time.prototype.fromElapsed = function(elapsedTime) {
	this.elapsedTime = elapsedTime
	control = this.elapsedTime;
	if (control >= 3600) {
		this.hours = Math.floor(control/3600);
		control = control-(3600*this.hours);
	} else {
		this.hours = 0
	}
	if (control >= 60) {
		this.minutes = Math.floor(control/60);
		control = control-(60*this.minutes);
	} else {
		this.minutes = 0
	}
	this.seconds = control;
	this.prettyString = ""+padInt(this.hours, 2)+":"+padInt(this.minutes, 2)+":"+padInt(this.seconds, 2)+""
	return this
}

Time.prototype.fromBoth = function(startTime, endTime) {
	this.startTime = startTime
	this.endTime = endTime
	this.elapsedTime = this.endTime - this.startTime
	control = this.elapsedTime;
	if (control >= 3600) {
		this.hours = Math.floor(control/3600);
		control = control-(3600*this.hours);
	} else {
		this.hours = 0
	}
	if (control >= 60) {
		this.minutes = Math.floor(control/60);
		control = control-(60*this.minutes);
	} else {
		this.minutes = 0
	}
	this.seconds = control;
	this.prettyString = ""+padInt(this.hours, 2)+":"+padInt(this.minutes, 2)+":"+padInt(this.seconds, 2)+""
	return this
}