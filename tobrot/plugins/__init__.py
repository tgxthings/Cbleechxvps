import asyncio
import shlex 
import shutil
import re

from tobrot import DOWNLOAD_LOCATION
from typing import Tuple

async def runcmd(cmd: str) -> Tuple[str, str, int, int]:
    """ run command in terminal """
    args = shlex.split(cmd)
    process = await asyncio.create_subprocess_exec(
        *args, stdout=asyncio.subprocess.PIPE, stderr=asyncio.subprocess.PIPE
    )
    stdout, stderr = await process.communicate()
    return (
        stdout.decode("utf-8", "replace").strip(),
        stderr.decode("utf-8", "replace").strip(),
        process.returncode,
        process.pid,
    )

def start_cleanup():
    try:
        shutil.rmtree(DOWNLOAD_LOCATION)
    except FileNotFoundError:
        pass


def is_gdtot_link(url: str): 
    url = re.match(r'https?://.+\.gdtot\.\S+', url) 
    return bool(url)


def is_hubdrive_link(url: str): 
    url = re.match(r'https?://hubdrive\.\S+', url) 
    return bool(url)


def is_appdrive_link(url: str): 
    url = re.match(r'https?://appdrive\.\S+', url) 
    return bool(url)

