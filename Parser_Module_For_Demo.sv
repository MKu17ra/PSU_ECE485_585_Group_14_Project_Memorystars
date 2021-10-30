module parser								//Parameters can be changed per module
  #(
    parameter TF_READ_BUFFER_WIDTH=64, 	//#1 Width of input buffer from TF
    parameter P_OUTPUT_WIDTH=64,		//Width of output from parser->MC
    parameter ADDR_WIDTH=36,			//width of addr portion of TF in
    parameter MEMOP_WIDTH=2,			//Width of mem op code of TF in
    parameter TF_MEMOP_TIME_WIDTH=8,	//Width of timestamp of TF in
    parameter TAG_WIDTH=8,				//Width of tag/parser timecode/info
    parameter IN_BUFF_SIZE=64,			//Width of MC buffer entry
    parameter IN_BUFF_CT=16			//Depth of MC buffer (how many positions in buffer)
  );
  
  int unsigned CUR_CNT;		//Count from inputting first line
  int unsigned TARGET_ADDY;	//Target addy for memop
  int unsigned MEMOP_CMD;	//Memop command
  int unsigned MEMOP_TIME;	//Time to perform memop(cycles)  
  int unsigned TAG;			//parser tag, stripped in mc	
  
  //OPEN TRACEFILE	
  initial begin
  int fd_r;
  fd_r = $fopen("tracefile.txt", "r");	//open tracefile in readmode
  if (fd_r)		$display("Tracefile opened");
  else			$display("Unable to open tracefile.");
    
  //READ TRACEFILE
    while ($fscanf (fd_r, "%d %d %X", MEMOP_TIME, MEMOP_CMD, TARGET_ADDY) == 3) begin
      $display ("displaying input: %d %d %x", MEMOP_TIME, MEMOP_CMD, TARGET_ADDY);
    end
  end
endmodule :parser
