# Week 4: Deploy your own backend
# Task 4.1: Safe setup

# Create a user appuser with no sudo power and no password login.
# Create /opt/myapp/ owned by appuser.

# Task 4.2: Get the code
# Clone the project from GitHub into /opt/myapp/. Install its dependencies.

# Proof: The app runs when started by hand as appuser.

# Task 4.3: Secrets
# Put environment variables (DB URL, secret keys) in a file only appuser can read.

# Proof: Another user gets "Permission denied" on it.

# Task 4.4: Run it as a service
# Write a systemd unit that runs the app as appuser, starts on boot, restarts on crash.

# Proof: Reboot the server. The app is back without you doing anything.

# Task 4.5: Nginx in front
# Nginx listens on port 80 and passes requests to your app (for example on 3000).

# Proof: Open the server IP in a browser and see your API respond.

# Task 4.6: Lock the doors
# Allow only ports 22 and 80 (and 443 if you do HTTPS). Block the rest.

# Proof: Port 3000 is not reachable from outside, but the site still works through Nginx.

# Task 4.7: Break and fix
# Ask a friend (or do it yourself) to break 3 things: kill the app, change a permission, stop Nginx.

# Fix each using only logs and status commands.

# Final proof: Write a 1-page README that explains the architecture:

# Browser → Nginx (80) → App (3000, as appuser) → DB

# with where the config, logs and files are.