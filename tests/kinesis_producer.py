import json
import boto3

def put_data_to_kinesis(stream_name, data):
    client = boto3.client('kinesis')

    # response = client.create_stream(
    #     StreamName='Planets',
    #     ShardCount=1
    # )

    response = client.put_record(
        StreamName=stream_name,
        Data=json.dumps(data),
        PartitionKey='XYZ')

    print({
        'statusCode': 200,
        'body': response
    })

def put_data_to_firehose(stream_name, data):
    client = boto3.client('firehose')

    response = client.put_record(
        DeliveryStreamName=stream_name,
        Record={'Data': json.dumps(data)})

    print({
        'statusCode': 200,
        'body': response
    })

if __name__ == "__main__":
    data = {"ticker_symbol":"TSLA", "sector":"TECHNOLOGY", "change":+8.00, "price":1000}
    put_data_to_firehose('raw-data-firehose', data)
    # put_data_to_kinesis('Planets', data)
