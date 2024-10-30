from hashlib import sha256
import lz4.frame
import tarfile
import os
import subprocess

with tarfile.open("Package.tar", "w") as File:
  for root, dirs, files in os.walk("Package"):
    for f in files:
      file_path = os.path.join(root, f)
      arcname = os.path.relpath(file_path, start="Package")
      File.add(file_path, arcname=arcname)

with open("Package.tar", 'rb') as File:
	Data = File.read()

CompressedData = lz4.frame.compress(Data)

with open('Out.npe', 'wb') as File:
  File.write(CompressedData)

subprocess.run(["gpg", "--output", "Package.sig", "--detach-sig", "Out.npe"], check=True)

