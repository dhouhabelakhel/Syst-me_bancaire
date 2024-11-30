const user=require('../models/user')
const jwt = require('jsonwebtoken');
const JWT_SECRET = 'your_jwt_secret_key';
exports.auth=async(req,res)=>{
    const { email, password } = req.body;

try {
    const authUser=await user.findOne({where:{email}});
    if(!authUser){
        return res.status(400).json({message:"verifier votre email"});
    }
    if (password !== authUser.password)
         { return res.status(400).json({ message: 'verifier votre mot de passe' }); }
    const token = jwt.sign({ userId: authUser.id,userName:authUser.name }, JWT_SECRET, { expiresIn: '1h' }); 
    res.status(200).json({ token });
} catch (error) {
    res.status(400).json({ message: 'erreur lors de l authentification', error });
}
}