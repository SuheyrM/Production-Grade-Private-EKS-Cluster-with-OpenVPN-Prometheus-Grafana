import pika

credentials = pika.PlainCredentials('admin', 'admin123')

connection = pika.BlockingConnection(
    pika.ConnectionParameters(
        host='rabbitmq.rabbitmq.svc.cluster.local',
        credentials=credentials
    )
)

channel = connection.channel()

# IMPORTANT: match existing queue (durable=True)
channel.queue_declare(queue='test', durable=True)

def callback(ch, method, properties, body):
    print("Received:", body.decode())

channel.basic_consume(
    queue='test',
    on_message_callback=callback,
    auto_ack=True
)

print("Waiting for messages...")
channel.start_consuming()
