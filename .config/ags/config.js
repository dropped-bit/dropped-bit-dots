
import GLib from "gi://GLib?version=2.0"

// Set images
App.addIcons(`${App.configDir}assets`)
// Get current username to generate absolute paths
const username = GLib.get_user_name()
const divide = ([total, free]) => free / total

// Get current time
const date = Variable("", {
    poll: [1000, 'date "+%H:%M:%S %b %e."'],
})

// Get CPU information
const cpu = Variable(0, {
    poll: [2000, 'top -b -n 1', out => divide([100, out.split('\n')
        .find(line => line.includes('Cpu(s)'))
        .split(/\s+/)[1]
        .replace(',', '.')])],
})

const cpuval = Variable(0, {
    poll: [2000, 'top -b -n 1', out => Math.round(divide([100, out.split('\n')
        .find(line => line.includes('Cpu(s)'))
        .split(/\s+/)[1]
        .replace(',', '.')])*100).toString() + "%"],
})

// Get RAM information
const ram = Variable(0, {
    poll: [2000, 'free', out => divide(out.split('\n')
        .find(line => line.includes('Mem:'))
        .split(/\s+/)
        .splice(1, 2))],
})

const ramval = Variable(0, {
    poll: [2000, 'free', out => Math.round(divide(out.split('\n')
        .find(line => line.includes('Mem:'))
        .split(/\s+/)
        .splice(1, 2))*100).toString() + "%"],
})
// CPU Widget
const cpuProgress = Widget.CircularProgress({
    className: "circularprocess",
    value: cpu.bind(),
    child: Widget.Label({
        label:cpuval.bind()
    })
})

const cpuProgressBox = Widget.Box({
    vertical: true,
    children: [
        cpuProgress,
        Widget.Label({
            className: "circularlabel",
            label: "CPU"
        })
    ]
})

// RAM Widget
const ramProgress = Widget.CircularProgress({
    className: "circularprocess",
    value: ram.bind(),
    child: Widget.Label({
        label:ramval.bind()
    })
})

const ramProgressBox = Widget.Box({
    vertical: true,
    children: [
        ramProgress,
        Widget.Label({
            className: "circularlabel",
            label: "RAM"
        })
    ]
})

const os = Widget.Label ({
    className: "os",
    label: "󰣇 "
})
const greeting = Widget.Label({
    className: "greeting",
    label: "dropped-arch"
})

const os_greeting = Widget.Box({
    vertical: false,
    children: [
        os,
        greeting
    ]
})

// test image
// const greeting = Widget.Box({
//     vertical: true,
//     children: [
//         Widget.Button({
//             className:"welcome",
//             onClicked: () => {
//                     print(':: Hello')
//                 }
//             label
//         })
//     ]
// })

// Sidebar Box
const Sidebar = Widget.Box({
    spacing: 16,
    vertical: true,
    className: "sidebar",
    children: [
        Widget.Box({
            className: "group",
            homogeneous: true,
            children:[os_greeting]
        }),
        Widget.Box({
            className: "group",
            homogeneous: true,
            children:[cpuProgressBox, ramProgressBox]
        }),
    ]
})

// Sidebar Window
const SideBarWindow = Widget.Window({
    name: 'sidebar',
    className:"window",
    anchor: ['top', 'right'],
    // Start with hidden window, toggle with ags -t sidebar
    // visible: true,
    visible: false,
    child: Widget.Box({
        css: 'padding: 1px;',
        child: Sidebar,
    })
})

// App Configuration
let config = {
    style: "./style.css",
    windows: [
        SideBarWindow,
    ],
    openWindowDelay: {
        'sidebar':100,
    },
    closeWindowDelay: {
        'sidebar': 50,
    },    
}

// Run AGS
App.config(config)
