/* LCM type definition class file
 * This file was automatically generated by lcm-gen
 * DO NOT MODIFY BY HAND!!!!
 */

package exlcm;
 
import java.io.*;
import java.util.*;
import lcm.lcm.*;
 
public final class imu implements lcm.lcm.LCMEncodable
{
    public float yaw;
    public float pitch;
    public float roll;
    public float magx;
    public float magy;
    public float magz;
    public float accelx;
    public float accely;
    public float accelz;
    public float gyrox;
    public float gyroy;
    public float gyroz;
    public float mtime;
 
    public imu()
    {
    }
 
    public static final long LCM_FINGERPRINT;
    public static final long LCM_FINGERPRINT_BASE = 0x201ffb038a89bbadL;
 
    static {
        LCM_FINGERPRINT = _hashRecursive(new ArrayList<Class<?>>());
    }
 
    public static long _hashRecursive(ArrayList<Class<?>> classes)
    {
        if (classes.contains(exlcm.imu.class))
            return 0L;
 
        classes.add(exlcm.imu.class);
        long hash = LCM_FINGERPRINT_BASE
            ;
        classes.remove(classes.size() - 1);
        return (hash<<1) + ((hash>>63)&1);
    }
 
    public void encode(DataOutput outs) throws IOException
    {
        outs.writeLong(LCM_FINGERPRINT);
        _encodeRecursive(outs);
    }
 
    public void _encodeRecursive(DataOutput outs) throws IOException
    {
        outs.writeFloat(this.yaw); 
 
        outs.writeFloat(this.pitch); 
 
        outs.writeFloat(this.roll); 
 
        outs.writeFloat(this.magx); 
 
        outs.writeFloat(this.magy); 
 
        outs.writeFloat(this.magz); 
 
        outs.writeFloat(this.accelx); 
 
        outs.writeFloat(this.accely); 
 
        outs.writeFloat(this.accelz); 
 
        outs.writeFloat(this.gyrox); 
 
        outs.writeFloat(this.gyroy); 
 
        outs.writeFloat(this.gyroz); 
 
        outs.writeFloat(this.mtime); 
 
    }
 
    public imu(byte[] data) throws IOException
    {
        this(new LCMDataInputStream(data));
    }
 
    public imu(DataInput ins) throws IOException
    {
        if (ins.readLong() != LCM_FINGERPRINT)
            throw new IOException("LCM Decode error: bad fingerprint");
 
        _decodeRecursive(ins);
    }
 
    public static exlcm.imu _decodeRecursiveFactory(DataInput ins) throws IOException
    {
        exlcm.imu o = new exlcm.imu();
        o._decodeRecursive(ins);
        return o;
    }
 
    public void _decodeRecursive(DataInput ins) throws IOException
    {
        this.yaw = ins.readFloat();
 
        this.pitch = ins.readFloat();
 
        this.roll = ins.readFloat();
 
        this.magx = ins.readFloat();
 
        this.magy = ins.readFloat();
 
        this.magz = ins.readFloat();
 
        this.accelx = ins.readFloat();
 
        this.accely = ins.readFloat();
 
        this.accelz = ins.readFloat();
 
        this.gyrox = ins.readFloat();
 
        this.gyroy = ins.readFloat();
 
        this.gyroz = ins.readFloat();
 
        this.mtime = ins.readFloat();
 
    }
 
    public exlcm.imu copy()
    {
        exlcm.imu outobj = new exlcm.imu();
        outobj.yaw = this.yaw;
 
        outobj.pitch = this.pitch;
 
        outobj.roll = this.roll;
 
        outobj.magx = this.magx;
 
        outobj.magy = this.magy;
 
        outobj.magz = this.magz;
 
        outobj.accelx = this.accelx;
 
        outobj.accely = this.accely;
 
        outobj.accelz = this.accelz;
 
        outobj.gyrox = this.gyrox;
 
        outobj.gyroy = this.gyroy;
 
        outobj.gyroz = this.gyroz;
 
        outobj.mtime = this.mtime;
 
        return outobj;
    }
 
}

