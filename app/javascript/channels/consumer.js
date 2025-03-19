import { createConsumer } from "@rails/actioncable"

const consumer = createConsumer()

export default consumer

console.log("Connected to the Consumer!")
