# Replace the spring.datasource.url with the DB VM's IP in application.properties
PROPERTIES_FILE="/home/vagrant/app/src/main/resources/application.properties"

if [ -f "$PROPERTIES_FILE" ]; then
    # Use sed to replace the existing datasource URL with the new one
    sed -i "s|^spring.datasource.url=.*|spring.datasource.url=jdbc:mysql://${DB_IP}:3306/chat_room_db|" $PROPERTIES_FILE
    echo "Updated spring.datasource.url with DB IP: ${DB_IP}"
else
    echo "application.properties file not found at $PROPERTIES_FILE"
fi