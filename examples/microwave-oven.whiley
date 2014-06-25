type nat is (int x) where x >= 0

// First, define the state of the microwave.
type Microwave is {
	bool heatOn, // if true, the oven is cooking
    bool doorOpen, // if true, the door is open
    nat timer // timer setting (in seconds)
} where !doorOpen || !heatOn

// A door closed event is triggered when the sensor detects that the door is closed.
function doorClosed(Microwave m) => Microwave
requires m.doorOpen:
    //
    m.doorOpen = false
    m.timer = m.timer + 1
    return m

// A door opened event is triggered when the sensor detects that the door is opened.
function doorOpened(Microwave m) => Microwave
requires !m.doorOpen:
    //
    m.doorOpen = true
    m.heatOn = false
    m.timer = m.timer + 1
    return m

// Signals that the "start cooking" button has been pressed.
function startCooking(Microwave m) => Microwave:
    // Here, we check the all important safety property
    if !m.doorOpen:
    	m.heatOn = true
    m.timer = m.timer + 1
    return m

function finishCooking(Microwave m) => Microwave:
    // Here, we check the all important safety property
    if !m.doorOpen:
    	m.heatOn = false
    m.timer = m.timer + 100
    return m    


method main(System.Console console):
	Microwave m1 = {heatOn: false, doorOpen: false, timer: 0}
	m1 = doorOpened(m1)
	console.out.println("doorOpened: "++m1)
	m1 = doorClosed(m1)
	console.out.println("doorClosed: "++m1)
	m1 = startCooking(m1)
	console.out.println("startCooking: " ++ m1)
	m1 = finishCooking(m1)
	console.out.println("finishCooking: " ++ m1)