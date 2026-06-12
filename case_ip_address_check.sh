# Store the first command-line argument in the variable IP_ADDRESS
IP_ADDRESS="${1}"

# Start a case statement to evaluate the value of IP_ADDRESS
case ${IP_ADDRESS} in

    # Match any IP address that starts with 192.168.
    192.168.*)

        # Display a message indicating that the IP belongs to the 192.168.x.x network
        echo "Network is 192.168.x.x"

        # End of this case option
        ;;
    
    # Match any IP address that starts with 10.0.
    10.0.*)

        # Display a message indicating that the IP belongs to the 10.0.x.x network
        echo "Network is 10.0.x.x"

        # End of this case option
        ;;
    
    # Match any other IP address that does not fit the previous patterns
    *)

        # Display a message indicating that the network could not be identified
        echo "Could not identify the network"

        # End of the default case option
        ;;
        
# End of the case statement
esac

# Example IP addresses that match the 192.168.x.x network pattern:
# 192.168.12.52
# 192.168.12.30
# 192.168.12.12