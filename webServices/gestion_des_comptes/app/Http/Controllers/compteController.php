<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Compte;
use App\Http\Requests\compteRequest ;
class compteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $comptes= Compte::all();
if (!$comptes->empty()) {
     return response()->json(['message'=>'aucun compte trouvée!!!'], 400);
}else{
    return response()->json(['message'=>'tous les compte','data'=>$comptes], 200);
}
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(compteRequest $request)
    {
try {
    $newCompte=$request->validated();
    compte::create($newCompte);
    if(!$newCompte){
        return response()->json(['message'=>'erreur lors de la creation du compte!!'], 400);
    }else{
        return response()->json(['message'=>'creer avec sucées','data'=>$newCompte], 201);
}
} catch (\Throwable $th) {
    return response()->json(['message' => 'Erreur lors de la création du compte : ' . $th->getMessage()], 400);
}

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $compte=compte::find($id);
        if(!$compte){
            return response()->json(['message'=>'aucun compte trouvée!!'], 404);
        }
        else {
            return response()->json(['message'=>'compte trouvée avec sucées','data'=>$compte], 200);

        }
    }
public function getByRib($rib){
    $compte = Compte::where('rib', $rib)->first();
        if(!$compte){
            return response()->json(['message'=>'aucun compte trouvée!!'], 404);
        }
        else {
            return response()->json(['message'=>'compte trouvée avec sucées','data'=>$compte], 200);

        }
}
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {try {
        $compte=compte::find($id);
        if (!$compte){
return response()->json(['message'=>'aucun compte trouvée'], 404);
        }else{
            $updatedCompte=$request->validate([
                'RIB'=>'nullable|string',
                'password'=>'nullable|string|min:8',
                'solde'=>'nullable',
                'user_id'=>'nullable'
            ]);
            $compte->fill($updatedCompte);
            $compte->save();
return response()->json(['message'=>'compte modifier avec succées','data'=>$compte], 200);
        }
    } catch (\Throwable $th) {
        return response()->json(['message' => 'Erreur lors de la création du compte : ' . $th->getMessage()], 400);

    }

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $compte=compte::find($id);
        if (!$compte){
            return response()->json(['message'=>'aucun compte trouvée'], 404);
        }else{
            $compte->delete();
            return response()->json(['message'=>'compte supprimer avec succées'], 200);
        }
    }
}
