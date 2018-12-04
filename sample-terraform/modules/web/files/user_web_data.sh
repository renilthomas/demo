#!/bin/bash

  yum update -y
  yum install -y httpd24 php56 php56-mysqlnd
  service httpd start
  chkconfig httpd on
  echo "<?php" >> /var/www/html/demodb.php
  echo "\$conn = new mysqli('mydb.demo.internal', 'root', 'secret', 'test');" >> /var/www/html/demodb.php
  echo "\$sql = 'SELECT * FROM mytable'; " >> /var/www/html/demodb.php
  echo "\$result = \$conn->query(\$sql); " >>  /var/www/html/demodb.php
  echo "while(\$row = \$result->fetch_assoc()) { echo 'the value is: ' . \$row['mycol'] ;} " >> /var/www/html/demodb.php
  echo "\$conn->close(); " >> /var/www/html/demodb.php
  echo "?>" >> /var/www/html/demodb.php