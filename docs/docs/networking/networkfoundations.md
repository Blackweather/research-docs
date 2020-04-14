# Networking Foundations: Networking Basics - LinkedIn Learning

## OSI Model
### Physical layer

### Data link layer

### Network layer
- controls the operations of the subnetwork it is on
- determines best physical path for data
    - uses network conditions to choose best path
    - uses priority of service to determine best path
    - uses other factors to determine best path

#### Network layer functions
- **routing** - routes frames among connected networks
- **subnet traffic control** - allows routers to send instructions to sending nodes to "throttle back" frame transmissions when buffers are filled
- **frame fragmentation** = determines frame size of routers located down stream. 
    - Maximum frame size is called maximum transmission unit size (MTU). 
    - Allows router to fragment frame into smaller sizes if needed.
    - Reassembles the full frame at destination.
- **Logical-physical address mapping** - translates logical addresses into physical addresses
- **Subnet usage accounting** - has a function that allows device to keep track of frames forwarded by subnet intermediate systems
    - Uses this to produce billing information
- build headers used by network layer on other devices to route packets to destination
- relieve higher layers of the need-to-know data transmission and switching technologies
- use protocols on lower layers to send data to destinations separated by intermediate nodes
- send information between adjacent nodes

### Transport Layer
- ensures messages are delivered error-free
- ensures messages are delivered in sequence
- ensures messages are delivered with no loss or duplication
- relieves higher protocols of concern for transfer of data
- size and complexity of transport protocols is dependent on service provided by network layer

#### Message segmentation function
- accepsts messages from session layer
- splits message into smaller units
- imposes message size limits on network layer protocols
- prepares header for each smaller unit created
- passes smaller units to network layer
- reassmebles message at destination
- header for smaller units contains certain elements
    - start and end flags
    - sequence information

#### Other functions
- **message acknowledgement** - provides reliable end-to-end delivery of messages
    - end-to-end delivery accompanied by acknowledgements
- **message traffic control** - controls rate of traffic sent when no buffers are available
- **session multiplexing** - breaks all the data coming in on one link into separate data streams
    - those data streams are called sessions
    - tracks which message belongs to which session

### Session Layer
- responsible for establishing sessions between processes running on different computers
- session establishment, maintenance, and termination
- session support

#### Session establishment, maintenance, termination
- allows application processes on different machines to do several things between the machines
- allows processes to establish a connection
- allows processes to use a connection
- allows processes to terminate a connection
- each connection is called a session

#### Session support
- performs security
- performs name recognition
- performs logging on

### Presentation layer
- formats data to be presented to the application layer
- translator for the network
- at sending station translates data from application layer format to common format
- at receiving station translates data from common format to format used by application layer

#### Presentation layer functions
- **character code translation** - for example ASCII to EBCDIC (encoding method used in emails)
- **data conversion** - for example bit order or CR-CR/LF or integer-floating point
- **data compression** - reduces number of bits needed to transmit data
- **data encryption** - for security purposes
    - encrypion of passwords

### Application layer
- serves as a window for users and applications to access network services

#### Application layer common functions
- **resource sharing**
- **device redirection**
- **remote file access**
- **remote printer access**
- **network management**
- **directory services**
- **email**
- **instant messaging**

### Encapsulation/De-encapsulation
- each layer of OSI model adds a header to the data
- layers also create a unit send to send or receive data
- the process of moving data down the OSI model is called encapsulation
- the process of moving data up the OSI model is called de-encapsulation

#### Encapsulation unit
- information on application layer through session layer is called data
- transport layer converts data to segments
- network layer converts segments to packets
- data link layer converts packets to frames
- physical layer converts frames to bits

## TCP/IP Model
- four layers:
    - application layer
    - transport layer
    - internet layer
    - network access layer
    