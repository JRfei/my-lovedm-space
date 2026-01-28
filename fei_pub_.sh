#!/bin/bash

set -e

PUB_KEY='ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINYbVzGwNdSvFS2UWcJjFNhoFSCdRDwVqMByxiGl4kAA'

SSH_DIR="$HOME/.ssh"
AUTH_KEYS="$SSH_DIR/authorized_keys"

# 1、创建 .ssh 目录（存在就跳过）
mkdir -p "$SSH_DIR"

# 2、设置权限（重复执行也安全）
chmod 700 "$SSH_DIR"

# 3、创建 authorized_keys（存在就复用）
touch "$AUTH_KEYS"
chmod 600 "$AUTH_KEYS"

# 4、写入公钥（避免重复）
grep -qxF "$PUB_KEY" "$AUTH_KEYS" || echo "$PUB_KEY" >> "$AUTH_KEYS"

echo " SSH 公钥已成功导入到 $AUTH_KEYS"

