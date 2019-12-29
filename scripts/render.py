import argparse
import json
import os
import pathlib

from jinja2 import Environment, FileSystemLoader, PackageLoader

def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        '-t', '--template-j2-file',
        dest='template_file',
        required=True
    )
    parser.add_argument(
        '-i', '--input-values-json-file',
        dest='values_file'
    )
    return parser.parse_args()

def main(args: argparse.Namespace):
    jenv = Environment(loader=FileSystemLoader('./src'))

    t = jenv.get_template(args.template_file)

    rendered_template = None
    values = {}

    if args.values_file:
        with open(args.values_file, "r") as values:
            values: dict = json.load(values)

    rendered_template = t.render(values)

    destination_dir_path =f'gen/{args.template_file.replace("Dockerfile.j2","")}'
    try:
        os.makedirs(destination_dir_path)
    except:
        pass

    output = open(f'gen/{args.template_file.replace(".j2","")}', "w")
    output.write(rendered_template)
    output.close()

    

if __name__ == "__main__":
    main(parse_args())
