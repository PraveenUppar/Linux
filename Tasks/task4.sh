# Task 1.4: Lock a file
# Create secret.txt that only alice can read and write. Bob must get "Permission denied".

# Proof: Switch to bob and try cat secret.txt. 

# Create alice and bob space and give access for edit and modify the space for user

# Create the secret file
echo "This is a secret message." > secret.txt

# Remove all permissions for group and others, leaving read/write only for the owner
chmod 600 secret.txt


# Switch to user bob
su - bob

# Attempt to read the file (adjust the path to where alice's file is located)
cat /home/alice/secret.txt
