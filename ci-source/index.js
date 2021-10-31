const https = require('https')

const timeout = parseFloat(Math.random() * 1000)
setTimeout(() => {
    const factRequest = https.request(
        'https://dog-api.kinduff.com/api/facts', factResponse => {
            factResponse.on('data', d => {
                console.log(d.toString())
            })
        })

    factRequest.on('error', error => {
        console.error(error)
    })

    factRequest.end()
}, timeout)

console.log('[im working very well]')

setTimeout(() => console.log('long operatiom', '1 2 3'), 1000)