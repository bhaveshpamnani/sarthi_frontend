const User = require("../model/user");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");

const JWT_SECRET = "12345";

////=--------SignUp----------=////
exports.signup = async (req,res)=>{
    try{
        const {name,email,password,phone} = req.body;

        //check User exists or not
        const existingUser = await User.findOne({$or:[{email},{phone}]});

        if(existingUser){
            const message = existingUser.email === email && existingUser.phone === phone ? "Email and PhoneNumber already Exists.":existingUser.email==email?"Email already exists.":"phone number already exists.";
            return res.status(400).json({message});
        }

        //create User 
        const user = new User({name,email,password,phone});

        await user.save();
        res.status(201).json({message:"User created successfully"});
    }catch(error){
        console.log(error);
        res.status(500).json({message:"Internal Server Error : ",error});
    }
};

////=--------Login----------=////
exports.login = async(req,res)=>{
    try{
        const {email,password} = req.body;

        //check User is exists or not 
        const user = await User.findOne({email});
        if(!user){
            return res.status(400).json({message:"Invalid Email or Password"});
        }

        //Check password
        const ismatched = await bcrypt.compare(password,user.password);
        if(!ismatched){
            return res.status(400).json({message:"Invalid Email or Password"});
        }

        //Genrate token 
        const token = jwt.sign({id:user._id},JWT_SECRET);

        res.status(201).json({message:"Login SuccesFully",token});
    }catch(error){
        console.log(error);
        res.status(500).json({message:"Internal Server Error : ",error});
    }
}

////=--------GetUserProfile----------=////
exports.getUserProfile = async(req,res)=>{
    try{
        const userId = req.params.id;
        const user = await User.findById(userId).select('-password');

        if(!user){
            return res.status(404).json({message:"User not found"});
        }
        res.status(200).json({user});
    }catch(err){
        res.status(500).json({message:"Internal Server Error : ",err});
    }
}

////=--------UpdateUserProfile----------=////
exports.updateUserProfile = async(req,res)=>{
    try{
        const userId = req.params.id;
        const {name,email,phone,address} = req.body;
        const UpdatedUser = await User.findByIdAndUpdate(userId,{name,email,phone,address},{new:true,runValidators:true}).select('-password');

        if(!UpdatedUser){
            return res.status(404).json({message:"User not found"});
        }
        res.status(200).json({UpdatedUser});
    }catch(error){
        console.log(error);
        res.status(500).json({message:"Internal Server Error : ",error});
    }
}