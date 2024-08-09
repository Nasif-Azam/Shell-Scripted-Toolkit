#!/bin/bash

GeneralInstruction(){
    echo " ******************************* Choose Your Preferences *******************************"
    echo " 1. Server Status"
    echo " 2. Calculator"
    echo " 3. HTML CSS Template"
    echo " 4. Disk Cleanup"
    echo " 5. Task Manager"
    echo " 6. Exit"
    read -p " Enter Preference Number: " instruction
    if [ "$instruction" == "1" ]; then
        ServerStatus        
    elif [ "$instruction" == "2" ]; then
        Calculator
    elif [ "$instruction" == "3" ]; then
        HTML_CSS_TEMP
    elif [ "$instruction" == "4" ]; then
        Disk_Cleanup
        GeneralInstruction
    elif [ "$instruction" == "5" ]; then        
        Task_Manager
        GeneralInstruction
    elif [ "$instruction" == "6" ]; then
        exit 0
    fi
}

ServerStatus() {
    echo " ******************************* Hi $username - Welcome To The Server Details ******************************* "
    echo " ******************************* CURRENT DATE AND TIME ****************************** "
    date +" Today is: %dth - %b ; Day = %A ; Time: %T"
    echo " ******************************* DISK SPACE AVAILABLE ******************************* "
    df -H | awk '{print " Disk Space Available: Free/Used: " $4 "/" $3 " :GB"}'
    echo " ******************************* SYSTEM UPTIME ******************************* "
    powershell -command "(Get-Date) - (gcim Win32_OperatingSystem).LastBootUpTime"
    GeneralInstruction
}

Calculator() {
    echo " ******************************* Hi $username - Welcome To The Calculator ******************************* "
    read -p " Please enter the first number: " num1
    read -p " Please enter the second number: " num2
    read -p " Please enter the operation (+, -, *, /): " op

    if [ "$op" == "+" ]; then
        type="Addition"
        result=$(awk "BEGIN {print $num1 + $num2}")
    elif [ "$op" == "-" ]; then
        type="Subtraction"
        result=$(awk "BEGIN {print $num1 - $num2}")
    elif [ "$op" == "*" ]; then
        type="Multiplication"
        result=$(awk "BEGIN {print $num1 * $num2}")
    elif [ "$op" == "/" ]; then
        type="Division"
        result=$(awk "BEGIN {print $num1 / $num2}")
    fi

    echo " The $type result of ($num1 $op $num2) = $result"
    GeneralInstruction
}

HTML_CSS_TEMP() {
    echo " ******************************* Hi $username - Welcome To The Template Maker ******************************* "
    read -p " Enter HTML project name: " projectName
    mkdir $projectName
    cd $projectName
    touch index.html

    # start index.html
    echo "<!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>$projectName</title>
        <link rel="stylesheet" type="text/css" href="style/style.css">
        <script defer src="javascript/index.js"></script>
    </head>
    " >> index.html
    echo "<body>
        <h1 class='headingTag'>Welcome $username,<br>This $projectName Template made by SHELL SCRIPT</h1>
        <div style='display: flex;'>
            <div style='height: 100px; width: 100px; margin: 10px 5px 0px 10px;' class='bg'>Background Color</div>
            <div style='height: 100px; width: 100px; margin: 10px 5px 0px 10px;' class='paragraph'>Paragraph Color</div>
            <div style='height: 100px; width: 100px; margin: 10px 5px 0px 10px;' class='heading'>Heading Color</div>
            <div style='height: 100px; width: 100px; margin: 10px 5px 0px 10px;' class='helper'>Helper Color</div>
            <div style='height: 100px; width: 100px; margin: 10px 5px 0px 10px;' class='iconBG'>Icon Background Color</div>
            <div style='height: 100px; width: 100px; margin: 10px 5px 0px 10px;' class='gradient'>Gradient Color</div>
            <div style='height: 100px; width: 100px; margin: 10px 5px 0px 10px;' class='gradientSupport'>Gradient Support Color</div>
            <div style='height: 100px; width: 100px; margin: 10px 5px 0px 10px;' class='shadow'>Shadow</div>
            <div style='height: 100px; width: 100px; margin: 10px 5px 0px 10px;' class='shadowSupport'>Shadow Support</div>
        </div>
    </body>
    </html>" >> index.html
    start index.html

    mkdir style
    mkdir javascript

    cd style
    touch style.css
    echo '@import url("https://fonts.googleapis.com/css2?family=Old+Standard+TT&family=Poppins:wght@600;700&display=swap");

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Old Standard TT", serif;
        scroll-behavior: smooth;
    }

    :root {
        /* --heading: rgb(0 10 45);
        --para: #777;
        --para-tint: #e4e4e4;
        --white: #fff;
        --black: #212529;
        --helper: #8490ff;
        --helper-tint: #f3f4ff;
        --overlay: #3e64ff;
        --iconBg: #90acd133;
        --bg: #f9f9ff;
        --gradient: linear-gradient(0deg, #8490ff 0%, #62bdfc 100%);
        --gradientSupport: -webkit-linear-gradient(0deg, #8490ff 0%, #62bdfc 100%);
        --shadow: 0px 0px 20px 0px #8490ff33;
        --shadowSupport: 0px 20px 20px 0px #8490ff4d; */


        /* --heading: rgb(0 10 45);
        --para: #777;
        --para-tint: #e4e4e4;
        --white: #fff;
        --black: #212529;
        --helper: #FBAB7E;
        --helper-tint: #f3f4ff;
        --iconBg: #BF764C33;
        --bg: rgb(249 249 255);
        --gradient: linear-gradient(0deg, #F7CE68 0%, #FBAB7E 100%);
        --gradientSupport: -webkit-linear-gradient(62deg, #FBAB7E 0%, #F7CE68 100%);
        --shadow: 0px 0px 20px 0px #BF764C33;
        --shadowSupport: 0px 20px 20px 0px #BF764C4d; */


        --heading: #000a2d;
        --para: #777;
        --para-tint: #e4e4e4;
        --white: #fff;
        --black: #212529;
        --helper: #22c1c3;
        --helper-tint: #f3f4ff;
        --iconBg: #22c1c333;
        --bg: rgb(249 249 255);
        --gradient: linear-gradient(0deg, #92EA94 0%, #22c1c3 100%);
        --gradientSupport: -webkit-linear-gradient(0deg, #22c1c3 0%, #92EA94 100%);
        --shadow: 0px 0px 20px 0px #92be7633;
        --shadowSupport: 0px 20px 20px 0px #92be7633;

    }

    html {
        overflow-x: hidden;
    }

    body {
        overflow-x: hidden;
    }

    h1,
    h2,
    h3,
    h4 {
        font-family: "Poppins", sans-serif;
    }

    h1 {
        color: var(--heading);
        font-weight: 600;
    }

    h3 {
        font-size: 1.8rem;
        font-weight: 400;
    }

    p {
        color: var(--para);
        font-size: 1.7rem;
        line-height: 1.6;
    }

    a {
        text-decoration: none;
    }

    li {
        list-style: none;
    }
    .headingTag{
        background-color: var(--helper);
    }


    .bg {
        background-color: var(--bg);
    }

    .paragraph {
        background-color: var(--para);
    }

    .heading {
        background-color: var(--heading);
    }
    .helper {
        background-color: var(--helper);
    }
    .iconBG {
        background-color: var(--iconBg);
    }
    .gradient {
        background: var(--gradient);
    }
    .gradientSupport {
        background: var(--gradientSupport);
    }
    .shadow {
        box-shadow: var(--shadow);
    }
    .shadowSupport {
        box-shadow: var(--shadowSupport);
    }' >> style.css

    cd ../javascript
    touch index.js
    echo '"use strict"' >> index.js

    GeneralInstruction
}

Disk_Cleanup() {
    user_path=$(cygpath -w "$HOME")

    open_directory() {
        path="$1"
        directory="$2"
        explorer.exe "$path"
        echo "Opened $directory directory: $path"
    }

    move_files() {
        path="$1"
        cleanup="UselessDirectory"
        echo "Moving files from $path --> $cleanup"
        mkdir $cleanup
        mv -i "$path"/* $cleanup
    }

    # Open temp directory
    temp_dir="$WINDIR\Temp"
    open_directory "$temp_dir" "Temp"
    move_files "$temp_dir"

    # Open %temp% directory
    percent_temp_dir="$user_path\AppData\Local\Temp"
    open_directory "$percent_temp_dir" "%Temp%"
    move_files "$percent_temp_dir"

    # Open recent directory
    # recent_dir="$user_path\Recent"
    # open_directory "$recent_dir" "Recent"
    # # move_files "$recent_dir"

    # Open prefetch directory
    prefetch_dir="$WINDIR\Prefetch"
    open_directory "$prefetch_dir" "Prefetch"
    move_files "$prefetch_dir"

    # Run 'tree' command
    sleep 5
    echo "Run 'tree' command."
    explorer.exe "$WINDIR\System32\tree.com"

}

Task_Manager(){

    KillTask() {
        pid=$1
        task_name=$2
        read -p " Do you want to kill the task '$task_name' with PID $pid? [y/n]: " confirm_kill
        if [ "$confirm_kill" == "y" ]; then
            taskkill -f -pid $pid
            echo " Task '$task_name' with PID $pid has been killed."
        else
            echo " Task '$task_name' with PID $pid was not killed."
        fi
    }
    tasklist_output=$(tasklist)
    echo " $tasklist_output"

    read -p " Enter the name of the task you want to find: " task_name
    pid=$(tasklist | awk -v task_name="$task_name" '$0 ~ task_name {print $2}')

    if [ -z "$pid" ]; then
        echo " Task '$task_name' not found."
    else
        echo " Task '$task_name' found. PID: $pid"
        KillTask $pid $task_name
    fi   

}




echo " ******************************* Welcome To signup page *******************************"
read -p " Please enter your name: " name
# read -p "Please enter your email address: " email
read -p " Please enter your password: " password
read -p " Please confirm your password: " confirm

if [ "$password" == "$confirm" ]; then
    echo " Signup Successfully!"
    echo " Name: $name"
    # echo " Email: $email"
else
    echo " Passwords do not match! Please try again."
fi

echo " ******************************* Welcome To login page *******************************"
read -p " Enter your name: " username
read -p " Enter your password: " userpassword

if [ "$username" == "$name" ] && [ "$password" == "$userpassword" ]; then
    echo " Login Successfully!"    
    GeneralInstruction    
else
    echo " Invalid user information! Please try again."
fi
