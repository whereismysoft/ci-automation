const type = process.env.TYPE
const json = process.env.JSON

const data = JSON.parse(json)

// console.log(data)

if (type === 'TICKET_DATA') {
    console.log(data[0]["description"])
    process.exit(0)
}

process.exit(1)

