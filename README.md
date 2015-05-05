Apple Reply
=====


    This was a bug in ARC versus the Objective-C runtime. 
    It has been fixed but I don't think any iOS release has the change yet.
    The safest solution is to call objc_allocateProtocol() and objc_registerProtocol() in a non-ARC file. 
    Your unsafe_unretained fix should also work. Adding an extra call to protocol_getName() is not a reliable fix.
